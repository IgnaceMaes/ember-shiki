import type { Lang, Theme } from 'shiki';

interface Config {
  defaultLanguages?: Lang[];
  defaultThemes?: Theme[];
  showLineNumbers?: boolean;
  showCopyButton?: boolean;
  cdnUrl?: string;
}

export { default as ShikiService } from './services/shiki.ts';
export { default as CodeGroup } from './components/code-group.ts';
export { default as CodeTab } from './components/code-tab.ts';
export { default as CodeBlock } from './components/code-block.ts';

let _config: Config = {};

export function setConfig(config: Config) {
  _config = config;
}

export { _config as config };
