export class Test {
  constructor(private readonly test: number) {}

  execute(): void {
    console.log(this.test);
  }
}
