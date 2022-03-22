<template>
    <div>
        <h1>Hello {{ trainerName }}</h1>
        <button v-on:click="trainees = true; events = false;">Show all trainee</button>
        <button v-on:click="trainees = false; events = true;">Show all events</button>
        <button v-on:click="newTrainee">Add new tranee</button>
        <trainee v-if="trainees"></trainee>
        <events v-if="events"></events> 

    </div>
</template>

<script>
 import Trainee from './Trainee.vue';
import Events from './Events.vue';
export default {
    data() {
        return {
           events: false,
           trainees: false
        }
    },
    props: ['trainerName'],
    methods: {
        allTrainees() {

            // this.$router.push('Trainee');
        },
        allEvents() {

            // this.$router.push('Events');
        },
        newTrainee() {
            // this.$router.push('newTrainee');
        }
    } ,
    components: { Trainee, Events }
}
</script>
