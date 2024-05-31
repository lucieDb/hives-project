import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import Router from './router/router.js'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap'

createApp(App).use(Router).mount('#app')
