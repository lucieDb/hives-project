<template>
  <div class="bg-light">
    <h1>Welcome to the Hives Project</h1>
    <hr>
    <div class="container">
      <div class='row'>
        <div v-if="error" class="alert alert-danger">
          {{ error }}
        </div>
        <div class='col-6'>
          <h2>Create a hive</h2>
          <br>
          <div>
            <input type="text" v-model="name" placeholder="enter the new hive name" class="hive-input" />
            <input type="text" v-model="weight" placeholder="enter the new hive weight" class="hive-input" />
          </div>
          <br>
          <button @click="createHive" type="button" class="btn btn-primary">Create</button>
        </div>
        <div class='col-6'>
          <h2>Hives list</h2>
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
  const error = ref(null)
  const weight = ref('')
  const API_URL = import.meta.env.VITE_API_URL

  onMounted(async () => {
      const response = await fetch(API_URL)
      hives.value = await response.json()
  })

  const createHive = async () => {
    error.value = null

    try { 
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

      if (!response.ok) {
        console.log('data', data)
        throw new Error(data.name || data.weight)
      }

      hives.value.push(data)
      name.value = ''
      weight.value = ''
    } catch (err) {
      error.value = err
      console.log('err', err)
    }
  }
</script>
