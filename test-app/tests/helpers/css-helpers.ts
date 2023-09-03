import { find } from '@ember/test-helpers';

export function getCssValue(selector: string, property: string) {
  const domElement = find(selector);
  if (domElement === null) {
    throw new Error('Element is null');
  }
  return window.getComputedStyle(domElement, null).getPropertyValue(property);
}
