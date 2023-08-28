import Application from 'test-app/app';
import config from 'test-app/config/environment';
import * as QUnit from 'qunit';
import { setApplication } from '@ember/test-helpers';
import { setup } from 'qunit-dom';
import { start } from 'ember-qunit';
import { setupGlobalA11yHooks } from 'ember-a11y-testing/test-support';

setApplication(Application.create(config.APP));

setup(QUnit.assert);

setupGlobalA11yHooks(() => true);

start();
