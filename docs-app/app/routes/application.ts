import Route from '@ember/routing/route';
import { service } from '@ember/service';
import { ShikiService } from 'ember-shiki';

export default class ApplicationRoute extends Route {
  @service declare shiki: ShikiService;

  async beforeModel() {
    await this.shiki.initialize.perform();
  }
}
