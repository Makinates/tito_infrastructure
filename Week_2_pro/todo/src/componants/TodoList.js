import { useState } from "react";
import TodoInput from "./TodoInput";
import TodoItem from "./TodoItem";
import './TodoList.css';

function TodoList() {
  const [todos, setTodos] = useState([]);
  return (
    <div className="todo-list-cintainer">
      <h1>My Todosssss</h1>
      <TodoInput todos={todos} setTodos={setTodos} />
      <div className="todo-items-wrapper">
       {todos.map((item, index,)=>{
        return(<TodoItem key={item.id} Ctodo={item} index={index +1}/>)
       })}
      </div>
    </div>
  );
}
export default TodoList;
