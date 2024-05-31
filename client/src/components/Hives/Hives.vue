<template>
  <div>
    <h1>Welcome to the Hives Project</h1>
    <hr>
    <div class="container">
      <div class='row'>
        <div class='col-6'>
          <h2>create a hive</h2>
          
        </div>
        <div class='col-6'>
          <h2>hives list</h2>
          <li v-for="hive in hives" :key="hive.id">
            {{ hive.name }}
            {{ hive.weight }}
          </li>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const hives = ref([])
const API_URL = "http://localhost:3000/api/v1/hives"

onMounted(async () => {
    const res = await fetch(API_URL)
    hives.value = await res.json()
})

</script>
