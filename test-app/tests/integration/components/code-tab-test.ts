import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | code-tab', function (hooks) {
  setupRenderingTest(hooks);

  test('renders visible tab', async function (assert) {
    await render(
      hbs`<CodeTab @name="tab 1" @activeTabName="tab 1">tab is visible</CodeTab>`
    );

    assert.dom().hasText('tab is visible');
    assert.dom('.code-tab--active').exists();
  });

  test("doesn't render invisible tab", async function (assert) {
    await render(
      hbs`<CodeTab @name="tab 1" @activeTabName="tab 2">tab is visible</CodeTab>`
    );

    assert.dom().hasText('tab is visible');
    assert.dom('.code-tab--active').doesNotExist();
  });
});
