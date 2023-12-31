import { CodeBlock } from 'ember-shiki';

const codeExample = `
require "erb"

# Build template data class.
class Product
  def initialize( code, name, desc, cost )
    @code = code
    @name = name
    @desc = desc
    @cost = cost

    @features = [ ]
  end

  def add_feature( feature )
    @features << feature
  end

  # Support templating of member data.
  def get_binding
    binding
  end

  # ...
end

# Create template.
template = %{
  <html>
    <head><title>Ruby Toys -- <%= @name %></title></head>
    <body>

      <h1><%= @name %> (<%= @code %>)</h1>
      <p><%= @desc %></p>

      <ul>
        <% @features.each do |f| %>
          <li><b><%= f %></b></li>
        <% end %>
      </ul>

      <p>
        <% if @cost < 10 %>
          <b>Only <%= @cost %>!!!</b>
        <% else %>
           Call for a price, today!
        <% end %>
      </p>

    </body>
  </html>
}.gsub(/^  /, '')

rhtml = ERB.new(template)

# Set up template data.
toy = Product.new( "TZ-1002",
                   "Rubysapien",
                   "Geek's Best Friend!  Responds to Ruby commands...",
                   999.95 )
toy.add_feature("Listens for verbal commands in the Ruby language!")
toy.add_feature("Ignores Perl, Java, and all C variants.")
toy.add_feature("Karate-Chop Action!!!")
toy.add_feature("Matz signature on left leg.")
toy.add_feature("Gem studded eyes... Rubies, of course!")

# Produce result.
rhtml.run(toy.get_binding)

# From https://docs.ruby-lang.org/en/2.3.0/ERB.html#class-ERB-label-Examples`;

<template>
  <CodeBlock @code={{codeExample}} @language="erb" />
</template>
