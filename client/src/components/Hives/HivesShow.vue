<template>
  <div>
    <h1>Hive Details</h1>
    <br>
    <div>
      <li>Name : {{ hive?.name }}</li>
      <li>Weight : {{ hive?.weight }}</li>
    </div>
  </div>
</template>
  
<script setup>
  import { ref, onMounted } from 'vue';
  import { useRoute } from 'vue-router';

  const route = useRoute()
  const id = route.params.id
  const hive = ref(null)
  const API_URL = import.meta.env.VITE_API_URL

  const fetchHivesShow = async () => {
    const res = await fetch(API_URL + `/${id}`)
   
    hive.value = await res.json()
  }

  onMounted(fetchHivesShow)
</script>