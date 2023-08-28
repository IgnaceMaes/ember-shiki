import { module, test } from 'qunit';
import { visit, currentURL } from '@ember/test-helpers';
import { setupApplicationTest } from 'test-app/tests/helpers';
import { a11yAudit } from 'ember-a11y-testing/test-support';

module('Acceptance | application', function (hooks) {
  setupApplicationTest(hooks);

  test('visiting /', async function (assert) {
    await visit('/');

    assert.strictEqual(currentURL(), '/');

    await a11yAudit();
  });
});
