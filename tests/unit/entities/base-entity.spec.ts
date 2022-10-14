/* eslint-disable @typescript-eslint/dot-notation */
import { faker } from '@faker-js/faker';
import { BaseEntity } from '@/shared/entities/base-entity';
import * as crypto from 'crypto';

jest.mock('crypto');
type MockedCrypto = jest.Mocked<typeof crypto>;
const mockedCrypto: MockedCrypto = crypto as MockedCrypto;

type SutProps = {
  id?: string | undefined | null;
  props?: any;
};

const createSut = ({
  id = faker.datatype.uuid(),
  props = { any_key: faker.name.fullName() },
}: SutProps = {}): BaseEntity<any> => {
  return new BaseEntity({ id: typeof id === 'string' ? id : undefined, props });
};

describe('BaseEntity', () => {
  it('Should set entity id with randomUuid if an id is not provided', () => {
    const mockedRandomUuid = faker.datatype.uuid();
    mockedCrypto.randomUUID.mockReturnValueOnce(mockedRandomUuid);

    const sut = createSut({ id: null });
    expect(sut.getId()).toBe(mockedRandomUuid);
  });

  it('Should set entity id with provided id', () => {
    const mockedId = faker.datatype.uuid();
    const sut = createSut({ id: mockedId });
    expect(sut.getId()).toBe(mockedId);
  });

  it('Should set entity with correct props', () => {
    const mockedProps = { any_key: faker.datatype.uuid() };
    const sut = createSut({ props: mockedProps });
    expect(sut['props']).toEqual(mockedProps);
  });

  it('Should return true if property is number', () => {
    expect(BaseEntity['isPropertyNumber'](faker.datatype.number())).toBeTruthy();
  });

  it('Should return true if property is number', () => {
    expect(BaseEntity['isPropertyNumber'](faker.datatype.number())).toBeTruthy();
  });

  it('Should return false if property is not a number', () => {
    expect(BaseEntity['isPropertyNumber'](faker.datatype.string())).toBeFalsy();
  });

  it('Should return true if property is string', () => {
    expect(BaseEntity['isPropertyString'](faker.datatype.string())).toBeTruthy();
  });

  it('Should return false if property is not a string', () => {
    expect(BaseEntity['isPropertyString'](faker.datatype.number())).toBeFalsy();
  });

  it('Should return true if property is undefined', () => {
    expect(BaseEntity['isPropertyUndefined'](undefined)).toBeTruthy();
  });

  it('Should return false if property is not undefined', () => {
    expect(BaseEntity['isPropertyUndefined'](faker.datatype.string())).toBeFalsy();
  });
});
