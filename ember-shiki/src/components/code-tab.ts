import Component from '@glimmer/component';

export interface CodeTabSignature {
  Args: {
    name: string;
    activeTabName: string;
  };
  Blocks: {
    default: [];
  };
}

export default class CodeTab extends Component<CodeTabSignature> {
  get isActive() {
    return this.args.activeTabName === this.args.name;
  }
}
