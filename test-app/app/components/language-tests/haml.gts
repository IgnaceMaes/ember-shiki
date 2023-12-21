import { CodeBlock } from 'ember-shiki';

const codeExample = `
!!! 5
%html
	%head
		%title Example HAML
		/[if IE]
			%link{ :rel => "stylesheet", :href => "/css/ie.css" }
	%body
		#container
			%header
				%h1 Our Awesome HTML5 Template
			#main
				Did we mention this was awesome?

				/ Only this line will be wrapped in a comment
				%blockquote
					%p Roads? Where we're going we don't need roads

				/
					Now the whole block will be commented out
					%blockquote
						%p Roads? Where we're going we don't need roads

				%p The line below won't appear in the HTML
				-# The rest of this line is a comment
				%p The line above won't appear in the HTML, nor will the lines underneath
				-#
					None of this text will appear in our
					rendered output

				%p= Time.now

			%footer
				%address
					.hcard
						.fn Ian Oxley
						.adr
							.locality Newcastle-upon-Tyne
							.country-name England

/ From https://gist.github.com/ianoxley/1147666
`;

<template>
  <CodeBlock @code={{codeExample}} @language="haml" />
</template>
