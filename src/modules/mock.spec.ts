import { Mock } from './mock';

describe('Mock', () => {
  it('Should console.log on execute', () => {
    const param = 2;
    const consoleSpy = jest.spyOn(console, 'log');
    new Mock(param).execute();
    expect(consoleSpy).toHaveBeenCalledWith(param);
  });
});
