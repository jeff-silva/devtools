<template>
  <div>
    <v-app-layout>
      <template #default="scope">
        <div class="pa-3">
          <slot
            name="default"
            v-bind="scope"
          ></slot>
        </div>
      </template>

      <template #drawer="scope">
        <v-nav
          :items="[
            { title: 'Home', to: '/' },
            {
              title: 'Tailwind',
              children: [{ title: 'Search', to: '/tailwind/search' }],
            },
          ]"
        />
        <slot
          name="drawer"
          v-bind="scope"
        ></slot>
      </template>
    </v-app-layout>
  </div>
</template>
