import { BaseEntity } from '@/shared/entities/base-entity';

export type InstructionProps = {
  order: number;
  description: string;
};

export class Instruction extends BaseEntity<InstructionProps> {
  constructor(props: InstructionProps, id?: string) {
    super({ props, id });
  }

  static create(props: InstructionProps, id?: string): Instruction {
    return new Instruction(props, id);
  }
}
