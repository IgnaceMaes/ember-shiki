import ApplicationInstance from '@ember/application/instance';
import { getOwner } from '@ember/application';
import { service } from '@ember/service';
import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import ShikiService from '../services/shiki';
import { Lang, Theme } from 'shiki';
import { SafeString, htmlSafe } from '@ember/template';

import '../styles.css';

export type LineHighlightType = 'neutral' | 'add' | 'remove';

export interface LineHighlight {
  start: number;
  end?: number;
  type: LineHighlightType;
}

export interface CodeBlockSignature {
  Args: {
    code: string;
    language?: Lang | string;
    theme?: Theme | string;
    name?: string;
    showCopyButton?: boolean;
    showLineNumbers?: boolean;
    isUriEncoded?: boolean;
    lineNumberStart?: number;
    lineHighlights?: LineHighlight[];
    onCodeHighlighted?: (
      code: string,
      language?: Lang | string,
      theme?: Theme | string,
    ) => void;
  };
  Element: HTMLDivElement;
  Blocks: {
    loading: [];
  };
}

export default class CodeBlock extends Component<CodeBlockSignature> {
  @service declare shiki: ShikiService;

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  fastboot?: any;

  @tracked renderedCode?: SafeString;

  constructor(owner: unknown, args: CodeBlockSignature['Args']) {
    super(owner, args);

    // Attempt to inject fastboot service
    this.fastboot = (getOwner(this) as ApplicationInstance)?.lookup(
      'service:fastboot',
    );

    if (this.fastboot && this.fastboot.isFastBoot) {
      const shikiRenderCompleted = new Promise((resolve) => {
        const { language, theme, lineHighlights } = this.args;
        this.shiki.render
          .perform(this.code, language, theme, lineHighlights)
          .then((rendered) => {
            this.onCodeHighlighted(rendered, this.code, language, theme);
            resolve(true);
          });
      });

      this.fastboot.deferRendering(shikiRenderCompleted);
    }
  }

  get code() {
    if (this.args.isUriEncoded) {
      return decodeURI(this.args.code);
    }
    return this.args.code;
  }

  get showLineNumbers() {
    if (this.args.showLineNumbers !== undefined) {
      return this.args.showLineNumbers;
    }

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const config: any = (
      getOwner(this) as ApplicationInstance
    )?.resolveRegistration('config:environment');
    const { showLineNumbers }: { showLineNumbers?: boolean } =
      config['ember-shiki'] ?? {};

    return showLineNumbers ?? false;
  }

  get showCopyButton() {
    if (this.args.showCopyButton !== undefined) {
      return this.args.showCopyButton;
    }

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const config: any = (
      getOwner(this) as ApplicationInstance
    )?.resolveRegistration('config:environment');
    const { showCopyButton }: { showCopyButton?: boolean } =
      config['ember-shiki'] ?? {};

    return showCopyButton ?? true;
  }

  get codeLines() {
    return this.code.split('\n');
  }

  get lineNumberStartStyle() {
    if (!this.args.lineNumberStart) {
      return htmlSafe('');
    }

    return htmlSafe(
      `--ember-shiki-line-number-start: ${this.args.lineNumberStart}`,
    );
  }

  onCodeHighlighted = (
    rendered: string,
    code: string,
    language?: Lang | string,
    theme?: Theme | string,
  ) => {
    this.renderedCode = htmlSafe(rendered);
    this.args.onCodeHighlighted?.(code, language, theme);
  };
}
