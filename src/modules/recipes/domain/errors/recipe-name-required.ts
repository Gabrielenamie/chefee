import { ApplicationError } from '@/shared/errors/application-error';

export class RecipeNameRequired extends ApplicationError {
  constructor() {
    super(400, 'Recipe name is required.', 'RecipeNameRequired');
  }
}
