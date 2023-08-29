import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | code-block', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(
      hbs`<CodeBlock @code="const x = 1;" @language="js" @theme="github-dark" />`
    );

    assert.dom().hasText('const x = 1;');
  });

  test('it can handle URI encoded code', async function (assert) {
    await render(
      hbs`<CodeBlock @code="console.log(%22hello%20world%22);" @language="js" @isUriEncoded={{true}} />`
    );

    assert.dom().hasText('console.log("hello world");');
  });
});
