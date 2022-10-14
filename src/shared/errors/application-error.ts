export class ApplicationError extends Error {
  constructor(public statusCode: number, message: string, name: string) {
    super(message);
    this.name = name;
  }
}
