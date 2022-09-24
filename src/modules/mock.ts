export class Mock {
  constructor(private readonly test: number) {}

  execute(): void {
    console.log(this.test);
  }
}
