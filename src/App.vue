<template>
  <div class="todo-app">
    <h1>📝 TodoList</h1>
    
    <div class="input-group">
      <input 
        v-model="newTodo" 
        @keyup.enter="addTodo" 
        placeholder="添加新任务..."
      />
      <button @click="addTodo">添加</button>
    </div>

    <div class="filters">
      <button 
        :class="{ active: filter === 'all' }" 
        @click="filter = 'all'"
      >全部</button>
      <button 
        :class="{ active: filter === 'pending' }" 
        @click="filter = 'pending'"
      >待完成</button>
      <button 
        :class="{ active: filter === 'completed' }" 
        @click="filter = 'completed'"
      >已完成</button>
    </div>

    <ul class="todo-list">
      <li 
        v-for="(todo, index) in filteredTodos" 
        :key="index"
        :class="{ completed: todo.completed }"
      >
        <input 
          type="checkbox" 
          v-model="todo.completed" 
        />
        <span>{{ todo.text }}</span>
        <button class="delete-btn" @click="removeTodo(index)">✕</button>
      </li>
    </ul>

    <div class="stats">
      共 {{ total }} 条 | 已完成 {{ completedCount }} 条
    </div>
  </div>
</template>

<script>
import { ref, computed } from 'vue'

export default {
  name: 'App',
  setup() {
    const newTodo = ref('')
    const todos = ref([
      { text: '学习 Vue', completed: false },
      { text: '完成作业', completed: true },
      { text: '健身运动', completed: false }
    ])
    const filter = ref('all')

    const filteredTodos = computed(() => {
      if (filter.value === 'pending') {
        return todos.value.filter(t => !t.completed)
      } else if (filter.value === 'completed') {
        return todos.value.filter(t => t.completed)
      }
      return todos.value
    })

    const total = computed(() => todos.value.length)
    const completedCount = computed(() => todos.value.filter(t => t.completed).length)

    const addTodo = () => {
      const text = newTodo.value.trim()
      if (text) {
        todos.value.push({ text, completed: false })
        newTodo.value = ''
      }
    }

    const removeTodo = (index) => {
      todos.value.splice(index, 1)
    }

    return {
      newTodo,
      todos,
      filter,
      filteredTodos,
      total,
      completedCount,
      addTodo,
      removeTodo
    }
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
  padding: 20px;
}

.todo-app {
  max-width: 500px;
  margin: 0 auto;
  background: white;
  border-radius: 16px;
  padding: 30px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
}

h1 {
  text-align: center;
  color: #333;
  margin-bottom: 20px;
}

.input-group {
  display: flex;
  gap: 10px;
  margin-bottom: 20px;
}

input[type="text"] {
  flex: 1;
  padding: 12px 16px;
  border: 2px solid #eee;
  border-radius: 8px;
  font-size: 16px;
  outline: none;
  transition: border-color 0.3s;
}

input[type="text"]:focus {
  border-color: #667eea;
}

button {
  padding: 12px 24px;
  background: #667eea;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
  transition: background 0.3s;
}

button:hover {
  background: #5568d3;
}

.filters {
  display: flex;
  gap: 10px;
  margin-bottom: 20px;
}

.filters button {
  flex: 1;
  background: #f0f0f0;
  color: #666;
}

.filters button.active {
  background: #667eea;
  color: white;
}

.todo-list {
  list-style: none;
}

.todo-list li {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px;
  border-bottom: 1px solid #eee;
  transition: background 0.3s;
}

.todo-list li:hover {
  background: #f9f9f9;
}

.todo-list li.completed span {
  text-decoration: line-through;
  color: #999;
}

.todo-list input[type="checkbox"] {
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.todo-list span {
  flex: 1;
  color: #333;
}

.delete-btn {
  padding: 6px 12px;
  background: #ff6b6b;
  font-size: 14px;
}

.delete-btn:hover {
  background: #ee5a5a;
}

.stats {
  text-align: center;
  margin-top: 20px;
  color: #666;
  font-size: 14px;
}
</style>
