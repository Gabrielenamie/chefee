import { Mock } from '@/modules/mock';
import { mock } from '@/tests/unit/mock';

describe('Mock', () => {
  it('Should console.log on execute', () => {
    const param = mock;
    const consoleSpy = jest.spyOn(console, 'log');
    new Mock(param).execute();
    expect(consoleSpy).toHaveBeenCalledWith(param);
  });
});
