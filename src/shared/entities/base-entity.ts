import { randomUUID } from 'crypto';

export type BaseEntityProps<Props> = {
  id?: string;
  props: Props;
};

export class BaseEntity<Props> {
  private readonly id: string;
  protected readonly props: Props;

  constructor(baseEntityProps: BaseEntityProps<Props>) {
    const { id, props } = baseEntityProps;

    this.id = BaseEntity.isPropertyString(id) ? id : randomUUID();
    this.props = props;
  }

  getId(): string {
    return this.id;
  }

  protected static isPropertyString(property: unknown): property is string {
    return typeof property === 'string';
  }

  protected static isPropertyNumber(property: unknown): property is number {
    return typeof property === 'number';
  }

  protected static isPropertyUndefined(property: unknown): property is undefined {
    return typeof property === 'undefined';
  }
}
