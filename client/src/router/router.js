import { createRouter, createWebHistory } from 'vue-router'
import Hives from '../components/Hives/HivesIndex.vue'
import HivesShow from '../components/Hives/HivesShow.vue'

const routes = [
  { path: '/', component: Hives },
  { path: '/hives/:id', component: HivesShow, props: true }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router