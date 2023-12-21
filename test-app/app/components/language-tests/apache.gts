import { CodeBlock } from 'ember-shiki';

const codeExample = `
# Apache httpd v2.4 minimal configuration
# see https://wiki.apache.org/httpd/Minimal_Config for documentation

ServerRoot ${GITPOD_REPO_ROOT}

PidFile ${APACHE_PID_FILE}
User ${APACHE_RUN_USER}
Group ${APACHE_RUN_GROUP}

# Modules as installed/activated via apt-get
IncludeOptional /etc/apache2/mods-enabled/*.load
IncludeOptional /etc/apache2/mods-enabled/*.conf

# Configure hostname and port for server
ServerName ${APACHE_SERVER_NAME}
Listen *:8080

# Configure Logging
LogFormat "%h %l %u %t \"%r\" %>s %b" common
CustomLog ${APACHE_LOG_DIR}/access.log common
ErrorLog ${APACHE_LOG_DIR}/error.log

# Never change this block
<Directory />
    AllowOverride None
    Require all denied
</Directory>

# Direcrory and files to be served
DirectoryIndex index.html
DocumentRoot "${GITPOD_REPO_ROOT}/www"
<Directory "${GITPOD_REPO_ROOT}/www">
    Require all granted
</Directory>

# Include conf installed via apt-get
IncludeOptional /etc/apache2/conf-enabled/*.conf

# https://github.com/gitpod-io/apache-example/blob/master/apache/apache.conf
`;

<template>
  <CodeBlock @code={{codeExample}} @language="apache" />
</template>
