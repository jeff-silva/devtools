<template>
  <nuxt-layout name="site">
    <template #default="scope">
      <pre>error: {{ error }}</pre>
    </template>
  </nuxt-layout>
</template>

<script setup lang="ts">
import type { NuxtError } from "#app";

const props = defineProps({
  error: Object as () => NuxtError,
});

const handleError = () => clearError({ redirect: "/" });
</script>
