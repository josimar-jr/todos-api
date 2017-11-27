import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';

@Component({
  selector: 'app-todo',
  templateUrl: './todo.component.html',
  styleUrls: ['./todo.component.css']
})
export class TodoComponent implements OnInit {

  title = 'app works!';
  todos;

  constructor(private http: Http){
    http.get('http://localhost:3000/books.json')
      .subscribe(res => this.todos = res.json());
  }

  ngOnInit() {
  }
}



