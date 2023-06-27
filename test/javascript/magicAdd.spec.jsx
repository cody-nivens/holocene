// inside test/javascript/magicAdd.spec.js
import magicAdd from 'magicAdd.js'

describe('magicAdd', () => {

  test('add two numbers', () => {
    // given
    let result = 0;
    // when
    result = magicAdd(1, 3)
    // then
    expect(result).toEqual(4);
  });
  
});

