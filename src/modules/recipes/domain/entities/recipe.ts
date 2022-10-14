import { BaseEntity } from '@/shared/entities/base-entity';
import { RecipeNameRequired } from '@/modules/recipes/domain/errors';
import { Nullable } from '@/shared/protocols';
import { Country, Instruction } from '@/modules/recipes/domain/entities';

export type RecipeTimeProps = {
  preparation: Nullable<number>;
  cooking: Nullable<number>;
};

export type RecipeProps = {
  name: string;
  time: Nullable<RecipeTimeProps>;
  servings: Nullable<number>;
  notes: Nullable<string>;
  url: Nullable<string>;
  country: Nullable<Country>;
  instructions: Instruction[];
  ingredients: any[];
};

export class Recipe extends BaseEntity<RecipeProps> {
  private constructor(props: RecipeProps, id?: string) {
    super({ props, id });
  }

  static create(params: Partial<RecipeProps>, id?: string): Recipe {
    const props = this.createProps(params);
    return new Recipe(props, id);
  }

  private static createProps(params: Partial<RecipeProps>): RecipeProps {
    if (!this.isPropertyString(params.name)) throw new RecipeNameRequired();

    const { name, notes, servings, time, url, country, instructions } = params;

    const props: RecipeProps = {
      name,
      notes: this.isPropertyString(notes) ? notes : null,
      servings: this.isPropertyNumber(servings) ? servings : null,
      url: this.isPropertyString(url) ? url : null,
      time: this.getParsedTime(time),
      country: !this.isPropertyUndefined(country) ? country : null,
      instructions: !this.isPropertyUndefined(instructions) ? instructions : [],
      ingredients: [],
    };
    return props;
  }

  private static getParsedTime(
    time: RecipeTimeProps | null | undefined,
  ): RecipeTimeProps {
    if (time === null || this.isPropertyUndefined(time)) {
      return { cooking: null, preparation: null };
    }

    return {
      cooking: this.isPropertyNumber(time.cooking) ? time.cooking : null,
      preparation: this.isPropertyNumber(time.preparation) ? time.preparation : null,
    };
  }

  getName(): string {
    return this.props.name;
  }

  getServings(): Nullable<number> {
    return this.props.servings;
  }

  getNotes(): Nullable<string> {
    return this.props.notes;
  }

  getTime(): Nullable<RecipeTimeProps> {
    return this.props.time;
  }

  getUrl(): Nullable<string> {
    return this.props.url;
  }

  getCountry(): Nullable<Country> {
    return this.props.country;
  }

  getIngredients(): any {
    return this.props.ingredients;
  }

  getInstructions(): any {
    return this.props.instructions;
  }
}
