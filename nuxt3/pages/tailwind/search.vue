<template>
  <nuxt-layout name="site">
    <v-container max-width="700">
      <v-text-field v-model="search.params.term" />

      <v-list>
        <v-list-item :subtitle="`Com o termo '${search.params.term}'`" />
        <template v-for="o in search.results.blocks">
          <v-list-item
            :href="o.url"
            target="_blank"
          >
            {{ o.name }}
          </v-list-item>
        </template>

        <v-list-item :subtitle="`Outros`" />
        <template v-for="o in search.results.others">
          <v-list-item
            :href="o.url"
            target="_blank"
          >
            {{ o.name }}
          </v-list-item>
        </template>
      </v-list>
    </v-container>
  </nuxt-layout>
</template>

<script setup>
const search = reactive({
  params: { term: "" },
  options: {},
  results: computed(() => {
    let blocks = [
      {
        name: "Tailwind Flex",
        url: "https://tailwindflex.com/search?q={term}",
      },
      {
        name: "Creative Tim",
        url: "https://www.creative-tim.com/twcomponents/search?query={term}",
      },
      {
        name: "Component Land",
        url: "https://componentland.com/components?q={term}",
      },
      {
        name: "Tailwind Awesome",
        url: "https://www.tailwindawesome.com/?order=trending&price=free&query={term}&technology=any&type=all",
      },
      {
        name: "Ready Made UI",
        url: "https://readymadeui.com/tailwind-components/{term}",
      },
    ].map((item) => {
      item.url = item.url.replace("{term}", search.params.term);
      return item;
    });

    const others = [
      { name: "Tail Blocks", url: "https://tailblocks.cc" },
      { name: "Wicked Blocks", url: "https://www.wickedblocks.dev" },
      {
        name: "Tailus",
        url: "https://html.tailus.io/blocks/hero-section/",
      },
      {
        name: "Merak UI",
        url: "https://merakiui.com/components/marketing/heros",
      },
      {
        name: "Material Tailwind",
        url: "https://www.material-tailwind.com/blocks",
      },
      {
        name: "Flowbite",
        url: "https://flowbite.com/blocks",
      },
      {
        name: "Flow Rift",
        url: "https://flowrift.com/w/",
      },
      {
        name: "Tailkits",
        url: "https://tailkits.com/free-components",
      },
      {
        name: "Hyper UI",
        url: "https://www.hyperui.dev",
      },
      {
        name: "Tail Grids",
        url: "https://tailgrids.com/components",
      },
    ];

    return { blocks, others };
  }),
});
</script>
