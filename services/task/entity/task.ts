import {Entity, Column, PrimaryGeneratedColumn} from 'typeorm'
import { UUID } from 'typeorm/driver/mongodb/bson.typings'

enum taskStatus { 
  NOT_STARTED,
  COMPLETE,
  IN_PROGRESS
}

@Entity()
export class Task { 
  @PrimaryGeneratedColumn()
  askId: number

  @Column()
  taskName: string

  @Column()
  taskDescription: string 

  @Column()
  taskStatus: taskStatus

  @Column()
  createdBy: string
}