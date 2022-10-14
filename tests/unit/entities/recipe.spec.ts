import { Recipe, RecipeProps } from '@/modules/recipes/domain/entities/recipe';
import { RecipeNameRequired } from '@/modules/recipes/domain/errors';
import { faker } from '@faker-js/faker';
import { mockCountryEntity } from '@/tests/unit/entities/mocks';

const mockRecipeProps = ({
  name = faker.name.fullName(),
  notes = faker.random.words(),
  servings = faker.datatype.number(100),
  time = {
    cooking: faker.datatype.number(100),
    preparation: faker.datatype.number(10),
  },
  country = mockCountryEntity(),
  url = faker.internet.url(),
  ingredients = [],
  instructions = [],
}: any = {}): Partial<RecipeProps> => ({
  name,
  notes,
  servings,
  time,
  url,
  ingredients,
  instructions,
  country,
});

describe('Recipe', () => {
  it('Should create recipe with correct properties', () => {
    const id = faker.datatype.uuid();
    const mockedRecipeProps = mockRecipeProps();
    const recipe = Recipe.create(mockedRecipeProps, id);
    expect(recipe.getId()).toEqual(id);
    expect(recipe.getName()).toEqual(mockedRecipeProps.name);
    expect(recipe.getNotes()).toEqual(mockedRecipeProps.notes);
    expect(recipe.getServings()).toEqual(mockedRecipeProps.servings);
    expect(recipe.getTime()).toEqual(mockedRecipeProps.time);
    expect(recipe.getCountry()).toEqual(mockedRecipeProps.country);
    expect(recipe.getIngredients()).toEqual([]);
    expect(recipe.getInstructions()).toEqual([]);
  });

  it('Should throw error if recipe name is not provided', async () => {
    const mockedRecipeProps = mockRecipeProps({ name: null });

    expect(() => {
      Recipe.create(mockedRecipeProps, faker.datatype.uuid());
    }).toThrowError(RecipeNameRequired);
  });

  it('Should set notes to null if is not sent', () => {
    const mockedRecipeProps = mockRecipeProps();
    delete mockedRecipeProps.notes;

    const recipe = Recipe.create(mockedRecipeProps, faker.datatype.uuid());
    expect(recipe.getNotes()).toBeNull();
  });

  it('Should set notes to null if is not sent', () => {
    const mockedRecipeProps = mockRecipeProps();
    delete mockedRecipeProps.notes;

    const recipe = Recipe.create(mockedRecipeProps, faker.datatype.uuid());
    expect(recipe.getNotes()).toBeNull();
  });

  it('Should set servings to null if is not sent', () => {
    const mockedRecipeProps = mockRecipeProps();
    delete mockedRecipeProps.servings;

    const recipe = Recipe.create(mockedRecipeProps, faker.datatype.uuid());
    expect(recipe.getServings()).toBeNull();
  });

  it('Should set url to null if is not sent', () => {
    const mockedRecipeProps = mockRecipeProps();
    delete mockedRecipeProps.url;

    const recipe = Recipe.create(mockedRecipeProps, faker.datatype.uuid());
    expect(recipe.getUrl()).toBeNull();
  });

  it('Should set country to null if is not sent', () => {
    const mockedRecipeProps = mockRecipeProps();
    delete mockedRecipeProps.country;

    const recipe = Recipe.create(mockedRecipeProps, faker.datatype.uuid());

    expect(recipe.getCountry()).toBeNull();
  });

  it('Should set time values to null if is not sent', () => {
    const mockedRecipeProps = mockRecipeProps();
    delete mockedRecipeProps.time;

    const recipe = Recipe.create(mockedRecipeProps, faker.datatype.uuid());
    expect(recipe.getTime()).toEqual({ cooking: null, preparation: null });
  });
});
