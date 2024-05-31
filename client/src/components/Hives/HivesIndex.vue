<template>
  <div>
    <h1>Welcome to the Hives Project</h1>
    <hr>
    <div class="container">
      <div class='row'>
        <div class='col-6'>
          <h2>create a hive</h2>
          <br>
          <input type="text" v-model="name" placeholder="enter the new hive name" />
          <input type="text" v-model="weight" placeholder="enter the new hive weight" />
          <button @click="createHive" type="button" class="btn btn-primary">Create</button>
        </div>
        <div class='col-6'>
          <h2>hives list</h2>
          <br>
          <li v-for="hive in hives" :key="hive.id">
            {{ hive.name }}
            <router-link :to="`/hives/${hive.id}`">Show details</router-link>
          </li>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

const hives = ref([])
const name = ref('')
const weight = ref('')
const API_URL = "http://localhost:3000/api/v1/hives";

onMounted(async () => {
    const res = await fetch(API_URL)
    hives.value = await res.json()
})

const createHive = async () => {
  const response = await fetch(API_URL, {
    method: 'POST',
    headers: {
    'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      name: name.value,
      weight: weight.value
    })
  })

  const data = await response.json();

  hives.value.push(data)
  name.value = ''
  weight.value = ''
}

</script>
