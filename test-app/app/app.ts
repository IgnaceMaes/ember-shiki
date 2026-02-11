import Application from '@ember/application';
import Resolver from 'ember-resolver';
import loadInitializers from 'ember-load-initializers';
import config from 'test-app/config/environment';
import { setConfig } from 'ember-shiki';

export default class App extends Application {
  modulePrefix = config.modulePrefix;
  podModulePrefix = config.podModulePrefix;
  Resolver = Resolver;
}

loadInitializers(App, config.modulePrefix);

setConfig({
  defaultLanguages: ['gjs', 'gts', 'sh', 'css'],
  defaultThemes: ['material-theme-palenight'],
  showLineNumbers: false,
  // cdnUrl: 'https://localhost:4200/',
});
