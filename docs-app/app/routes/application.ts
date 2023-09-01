import Route from '@ember/routing/route';
import { service } from '@ember/service';
import { ShikiService } from 'ember-shiki';

export default class ApplicationRoute extends Route {
  @service declare shiki: ShikiService;

  async beforeModel() {
    await this.loadCustomGrammar();
    await this.loadCustomTheme();
  }

  async loadCustomGrammar() {
    // Shiki has to be initialized before the highlighter is available
    await this.shiki.initialize.perform();
    // Get custom grammar
    const glimmerHandlebarsGrammar = await fetch('https://raw.githubusercontent.com/IgnaceMaes/glimmer-textmate-grammar/main/handlebars.tmLanguage.json');
    const glimmerHandlebars = {
      id: 'handlebars',
      path: '',
      scopeName: 'text.html.handlebars',
      grammar: await glimmerHandlebarsGrammar.json(),
      aliases: ['hbs'],
    };
    // Load embedded languages first
    await this.shiki.loadLanguageAndEmbedded('js');
    await this.shiki.loadLanguageAndEmbedded('css');
    // Finally, register the custom language to the Shiki highlighter
    await this.shiki.highlighter?.loadLanguage(glimmerHandlebars);
  }

  async loadCustomTheme() {
    await this.shiki.initialize.perform();
    const blackTheme = await fetch(
      'https://raw.githubusercontent.com/Jaakkko/vscode-black-theme/master/themes/black.json',
    );
    const blackThemeJson = await blackTheme.json();
    blackThemeJson.name = 'Black';
    await this.shiki.highlighter?.loadTheme(blackThemeJson);
  }
}
