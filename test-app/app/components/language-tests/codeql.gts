import { CodeBlock } from 'ember-shiki';

const codeExample = `
/**
 * @name LDAP query built from user-controlled sources
 * @description Building an LDAP query from user-controlled sources is vulnerable to insertion of
 *              malicious LDAP code by the user.
 * @kind path-problem
 * @problem.severity error
 * @id py/ldap-injection
 * @tags experimental
 *       security
 *       external/cwe/cwe-090
 */

import python
import experimental.semmle.python.security.injection.LDAP
import DataFlow::PathGraph

from LDAPInjectionFlowConfig config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select sink.getNode(), source, sink, "$@ LDAP query parameter comes from $@.", sink.getNode(),
  "This", source.getNode(), "a user-provided value"

// a concept

module LDAPEscape {
  abstract class Range extends DataFlow::Node {
    abstract DataFlow::Node getAnInput();
  }
}

class LDAPEscape extends DataFlow::Node {
  LDAPEscape::Range range;

  LDAPEscape() { this = range }

  DataFlow::Node getAnInput() { result = range.getAnInput() }
}

// a library modeling

private module LDAP2 {
  private class LDAP2QueryMethods extends string {
    LDAP2QueryMethods() {
      this in ["search", "search_s", "search_st", "search_ext", "search_ext_s"]
    }
  }

  private class LDAP2Query extends DataFlow::CallCfgNode, LDAPQuery::Range {
    DataFlow::Node ldapQuery;

    LDAP2Query() {
      exists(DataFlow::AttrRead searchMethod |
        this.getFunction() = searchMethod and
        API::moduleImport("ldap").getMember("initialize").getACall() =
          searchMethod.getObject().getALocalSource() and
        searchMethod.getAttributeName() instanceof LDAP2QueryMethods and
        (
          ldapQuery = this.getArg(0)
          or
          (
            ldapQuery = this.getArg(2) or
            ldapQuery = this.getArgByName("filterstr")
          )
        )
      )
    }

    override DataFlow::Node getQuery() { result = ldapQuery }
  }

  private class LDAP2EscapeDNCall extends DataFlow::CallCfgNode, LDAPEscape::Range {
    LDAP2EscapeDNCall() {
      this = API::moduleImport("ldap").getMember("dn").getMember("escape_dn_chars").getACall()
    }

    override DataFlow::Node getAnInput() { result = this.getArg(0) }
  }

  private class LDAP2EscapeFilterCall extends DataFlow::CallCfgNode, LDAPEscape::Range {
    LDAP2EscapeFilterCall() {
      this =
        API::moduleImport("ldap").getMember("filter").getMember("escape_filter_chars").getACall()
    }

    override DataFlow::Node getAnInput() { result = this.getArg(0) }
  }
}

// a taint flow config

class LDAPInjectionFlowConfig extends TaintTracking::Configuration {
  LDAPInjectionFlowConfig() { this = "LDAPInjectionFlowConfig" }

  override predicate isSource(DataFlow::Node source) { source instanceof RemoteFlowSource }

  override predicate isSink(DataFlow::Node sink) { sink = any(LDAPQuery ldapQuery).getQuery() }

  override predicate isSanitizer(DataFlow::Node sanitizer) {
    sanitizer = any(LDAPEscape ldapEsc).getAnInput()
  }
}

// From https://github.com/github/codeql/pull/5443/files
`;

<template>
  <CodeBlock @code={{codeExample}} @language="codeql" />
</template>
