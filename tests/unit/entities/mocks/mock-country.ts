import { Country, CountryProps } from '@/modules/recipes/domain/entities';
import { faker } from '@faker-js/faker';

export const mockCountryProps = ({
  name = faker.name.firstName(),
  flagUrl = faker.internet.url(),
} = {}): CountryProps => ({
  name,
  flagUrl,
});

export const mockCountryEntity = ({
  name = faker.name.firstName(),
  flagUrl = faker.internet.url(),
} = {}): Country => {
  return Country.create(mockCountryProps({ name, flagUrl }));
};
