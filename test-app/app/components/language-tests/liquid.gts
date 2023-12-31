import { CodeBlock } from 'ember-shiki';

const codeExample = `
<h3>Recommended Products</h3>
<ul class="recommended_products">
  {% assign recommended_products =  product.metafields.my_fields.rec_products.value %}
  {% for product in recommended_products  %}
    <li>
      <a href="{{ product.url }}">
        {{ product.featured_image | image_url: width: 400 | image_tag: loading: 'lazy' }}
        {{product.title}}
      </a>
    </li>
  {% endfor %}
</ul>

{%- comment -%} From https://www.codeshopify.com/blog_posts/related-products-with-product_list-sections-metafields {%- endcomment -%}
`;

<template>
  <CodeBlock @code={{codeExample}} @language="liquid" />
</template>
