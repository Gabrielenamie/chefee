import { BaseEntity } from '@/shared/entities/base-entity';

export type CountryProps = {
  name: string;
  flagUrl: string;
};

export class Country extends BaseEntity<CountryProps> {
  constructor(props: CountryProps, id?: string) {
    super({ props, id });
  }

  static create(props: CountryProps, id?: string): Country {
    return new Country(props, id);
  }
}
