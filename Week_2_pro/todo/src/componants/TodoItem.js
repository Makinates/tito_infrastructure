import { PencilIcon, TrashIcon } from "@heroicons/react/outline";
import "./TodoItems.css";

function TodoItem({ Ctodo, index }) {
  return (
    <div className="todo-item-wrapper">
      <div className="todo-item-text">
        <div>{index} .</div>
        <div>{Ctodo.name}</div>
      </div>
      <div className="todo-item-button">
        <button className="pencil-button">
          <PencilIcon />
        </button>
        <button className="trash-button">
          <TrashIcon />
        </button>
      </div>
    </div>
  );
}
export default TodoItem;
