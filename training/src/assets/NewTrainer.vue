<template>
    <div>
        <input type="text" v-model="name">
        <button v-on:click="addTrainer">Add</button>
    </div>
</template>

<script>

export default {
    data() {
        return {
            name: '' 
        }
    },
    methods: {
        addTrainer() {
            //send add to http .then
            // this.$router.push('/'')
        }
    }
}
</script>
