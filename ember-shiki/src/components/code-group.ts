import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import CodeTab from './code-tab';
import { WithBoundArgs } from '@glint/template';

export interface CodeGroupSignature {
  Args: {
    names: string[];
  };
  Blocks: {
    default: [tab: WithBoundArgs<typeof CodeTab, 'activeTabName'>];
  };
}
export default class CodeGroup extends Component<CodeGroupSignature> {
  @tracked activeTabName = '';

  constructor(owner: unknown, args: CodeGroupSignature['Args']) {
    super(owner, args);

    if (this.args.names[0]) {
      this.activeTabName = this.args.names[0];
    }
  }

  setActiveTab = (tabName: string) => {
    this.activeTabName = tabName;
  };

  isActiveTab = (tabName: string) => {
    return this.activeTabName === tabName;
  };
}
