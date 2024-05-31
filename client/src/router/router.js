import { createRouter, createWebHistory } from 'vue-router'
import Hives from '../components/Hives/HivesIndex.vue'
import HiveShow from '../components/Hives/HiveShow.vue'

const routes = [
  { path: '/', component: Hives },
  { path: '/hives/:id', component: HiveShow, props: true }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router