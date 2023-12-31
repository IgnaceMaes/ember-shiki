import { CodeBlock } from 'ember-shiki';

const codeExample = `
module person
    def ssn = 123-45-6789
    module name
        def first = "John"
        def middle = "Q"
        def last = "Public"
    end
    module birth
        def city = "Pittsburg"
        def state = "PA"
        def country = "USA"
        def date = parse_date["2000-01-01", "Y-m-d"]
    end
end

module mymodule
    def R = {1; 2}
    ic {count[R] = 2}
end

@inline
module my_stats[R]
    def my_minmax = (min[R], max[R])
    def my_mean = mean[R]
    def my_median = median[R]
end

@inline
module BipartiteGraph[M, N]
    def node = M; N
    def edge = M, N
end

@inline
module CycleGraph[N]
    def node = N
    def edge(a in N, b in N) =
            sort[N](x, a)
        and sort[N](y, b)
        and y = x%count[N] + 1
        from x, y
end

@inline
module GraphProperties[G]
    def outdegree[v in G:node] = count[v1 : G:edge(v, v1)] <++ 0
    def indegree[v in G:node] = count[v1 : G:edge(v1, v)] <++ 0
    def edge_count = count[G:edge] <++ 0
end

def cg = CompleteGraph[range[1 ,5, 1]]
def cg_props = GraphProperties[cg]

def bg = BipartiteGraph[{1; 2}, {3; 4; 5}]
def bg_props = GraphProperties[bg]

def cycleg = CycleGraph[{"a"; "b"; "c"; "d" ; "e"}]
def cycleg_props = GraphProperties[cycleg]

module output
    def complete_edge_count = cg_props:edge_count
    def bipartite_edge_count = bg_props:edge_count
    def cycle_edge_count = cycleg_props:edge_count
end

# From https://docs.relational.ai/rel/concepts/modules/`;

<template>
  <CodeBlock @code={{codeExample}} @language="rel" />
</template>
