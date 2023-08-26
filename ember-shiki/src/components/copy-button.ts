import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';

import { task, timeout } from 'ember-concurrency';

export interface CopyButtonSignature {
  Args: {
    text: string;
  };
}

export default class CopyButton extends Component<CopyButtonSignature> {
  @tracked showCopied = false;

  loadLanguageTask = task(async () => {
    await navigator.clipboard.writeText(this.args.text);
    this.showCopied = true;
    await timeout(2000);
    this.showCopied = false;
  });

  copyToClipboard = async () => {
    await this.loadLanguageTask.perform();
  };
}
