<template>
  <div class="bg-light">
    <h1>Hive Details</h1>
    <br>
    <div v-if="error" class="alert alert-danger">
      {{ error }}
    </div>
    <div v-else>
      <li >Name : {{ hive?.name }}</li>
      <li>Weight : {{ hive?.weight }} kg</li>
    </div>
  </div>
</template>
  
<script setup>
  import { ref, onMounted } from 'vue';
  import { useRoute } from 'vue-router';

  const route = useRoute()
  const id = route.params.id
  const hive = ref(null)
  const error = ref(null)

  const API_URL = import.meta.env.VITE_API_URL

  const fetchHivesShow = async () => {
    
    try {
      const response = await fetch(API_URL + `/${id}`)

      if(!response.ok) {
        const errorData = await response.json()               
        throw new Error(errorData.error)
      }

      hive.value = await response.json()
    } catch (err) {
      error.value = err.message
    }
  }

  onMounted(fetchHivesShow)
</script>