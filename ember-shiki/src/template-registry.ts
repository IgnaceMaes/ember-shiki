import type CodeBlock from './components/code-block';
import type CodeGroup from './components/code-group';
import type CodeTab from './components/code-tab';
import type CopyButton from './components/copy-button';
import ShikiRender from './modifiers/shiki-render';

export default interface EmberShikiRegistery {
  CodeBlock: typeof CodeBlock;
  CodeGroup: typeof CodeGroup;
  CodeTab: typeof CodeTab;
  'code-tab': typeof CodeTab;
  CopyButton: typeof CopyButton;
  'shiki-render': typeof ShikiRender;
}
