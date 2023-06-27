import HelloController from 'controllers/hello_controller';
import { Application } from '@hotwired/stimulus';

describe('HelloController', () => {
  beforeEach(() => {
    document.body.innerHTML = '<div data-controller="hello" />';
    window.Stimulus = Application.start();
    Stimulus.register('hello', HelloController);
  });

  it('shows hello world', () => {
    const el = document.querySelector('[data-controller="hello"]');
    expect(el).toHaveTextContent('Hello World!');
  });
});
