<template>
    <div>
        <input type="text" v-model="name">
        <button v-on:click="addTrainee">Add</button>
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
        addTrainee() {
            //send add to http
            // this.$router.push(trainer)
        }
    }
}
</script>
