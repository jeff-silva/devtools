<template>
  <nuxt-layout name="site">
    <template #default="scope">
      <v-card>
        <v-table>
          <colgroup>
            <col width="*" />
            <col width="400px" />
          </colgroup>
          <thead>
            <tr>
              <th>Item</th>
              <th>Tags</th>
            </tr>
          </thead>
          <tbody>
            <template v-for="o in links.items">
              <tr>
                <td>
                  <a href="">{{ o.name }}</a>
                </td>
                <td>
                  <div class="d-flex ga-2">
                    <template v-for="oo in o.tags">
                      <v-chip :color="oo.color">
                        {{ oo.name }}
                      </v-chip>
                    </template>
                  </div>
                </td>
              </tr>
            </template>
          </tbody>
        </v-table>
      </v-card>

      <!-- <pre>links.items: {{ links.items }}</pre> -->
    </template>
  </nuxt-layout>
</template>

<script setup>
const getRandomColor = () => {
  var letters = "0123456789ABCDEF";
  var color = "#";
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
};

const links = reactive({
  tags: [
    { id: "generator", name: "Data Generator", color: getRandomColor() },
    { id: "preloader", name: "Preloader", color: getRandomColor() },
    { id: "svg", name: "SVG", color: getRandomColor() },
    { id: "seo", name: "SEO", color: getRandomColor() },
    { id: "name-checker", name: "Name Checker", color: getRandomColor() },
    { id: "alternative", name: "Alternative", color: getRandomColor() },
  ],
  items: computed(() => {
    let items = [
      {
        name: "SVG Preloaders",
        url: "https://www.svgbackgrounds.com/elements/animated-svg-preloaders/",
        tags: ["svg", "preloader"],
      },
      {
        name: "HTML Icons and Letters",
        url: "https://www.toptal.com/designers/htmlarrows/letters/",
        tags: [],
      },
      {
        name: "The One Generator",
        url: "https://theonegenerator.com/pt",
        tags: ["generator"],
      },
      {
        name: "4Devs",
        url: "https://www.4devs.com.br",
        tags: ["generator"],
      },
      {
        name: "Technical SEO",
        url: "https://technicalseo.com/tools/",
        tags: ["seo"],
      },
      {
        name: "Brand Snag",
        url: "https://brandsnag.com/social-media-handle-checker",
        tags: ["name-checker"],
      },
      {
        name: "Name Checkr",
        url: "https://www.namecheckr.com/",
        tags: ["name-checker"],
      },
      {
        name: "Open Source Alternative to Softwares",
        url: "https://www.opensourcealternative.to",
        tags: ["alternative"],
      },
    ];

    return items.map((item) => {
      item.tags = item.tags.map((tagId) => {
        return links.tags.filter((t) => t.id == tagId).at(0) || null;
      });
      return item;
    });
  }),
});
</script>
