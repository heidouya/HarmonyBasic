export interface IUser {
  name: string
  password: string
}

@ObservedV2
export class User {
  @Trace name: string
  @Trace password: string
  constructor(user:IUser) {
    this.name = user.name
    this.password = user.password
  }
}