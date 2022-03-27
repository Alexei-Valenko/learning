<template>
    <div>
        <router-link to="/"  active-class="active">Back to Trainer</router-link>
       
        <h1>Table of events</h1>
        <table>
            <tr> 
                <th>Date</th>
                <th>Hour</th>
                <th>Length</th>
            </tr>
            <tr v-for="(event, index) in events" :key="index" v-on:click="showProperties(index)">
                <th>{{event.date}}</th>
                <th>{{event.hour}}</th>
                <th>{{event.length}}</th>
            </tr>
        </table>
        <br>
        <!-- <div v-on:hide-event-properties="hideProperties"> -->
            <eventProperties 
                v-if="currentEvent !== undefined && showEventProperties == true" 
                v-bind:event="currentEvent"  
                v-on:hide-event-properties="hideProperties"
                v-on:updated='update'></eventProperties>
        <!-- </div> -->
        <br>
        <button v-if="addingNew == false" v-on:click="addEvent"> Add New Event </button>
        <div v-else>        
            <h2 style="color:red"> {{msg}} </h2>
            <strong> Enter New Event</strong>
            <input type="text" placeholder="Enter date(YYYY-MM-DD)" v-model="inputDate"/>
            <input type="text" placeholder="Enter hour" v-model="inputHour"/>
            <input type="text" placeholder="Enter length" v-model="inputLength"/>
            <button v-on:click="submit"> Add </button>
            <button v-on:click="cancel"> Cancel </button>
        </div>
    </div>
</template>

<script>

import EventProperties from './EventProperties.vue';
export default {
    data() {
        return {
            events: [],
            currentEvent: undefined,
            addingNew: false,
            inputDate: '',
            inputHour: '',
            inputLength: '',
            showEventProperties: false,
            msg: ''
        }
    },
    methods: {
        addEvent() {
            this.addingNew = true;            
        },

        submit() {
            
             this.axios.post(`/api/events`, { date: this.inputDate + 'T' + this.inputHour + ':00:00Z' , length: this.inputLength, trainer_id:  this.trainerId})
                .then(
                    response => {
                        console.log(response.data);
                        if(response.data.events == 'old') {
                            this.msg = ' New event can not be in the past.'
                        }
                        else {                            
                            this.msg = '';
                            this.update();                            
                            this.addingNew = false;            
                            this.inputDate = '';
                            this.inputHour = '';
                            this.inputLength = '';
                        }
                    },
                     error => console.log(error)
                );

        },

        cancel() {
             this.addingNew = false;
             this.inputDate = '';
             this.inputHour = '';
             this.inputLength = '';
        },

        showProperties(index) {
            this.showEventProperties = true;
            this.currentEvent = this.events[index];
        },

        hideProperties() {
            this.showEventProperties = false

        },

        update() {
            this.trainerId =  localStorage.getItem("trainerId");
            this.axios.get('/api/events?trainer_id=' + this.trainerId) 
                .then(
                    response => {                   
                        this.events = response.data.events; 
                        this.events.forEach( item => {
                            if(item.date !== undefined) {
                                const date = new Date(item.date);
                                item.date = date.getUTCFullYear() + '-' + (date.getUTCMonth() + 1 ) + '-' + date.getUTCDate();
                                item.hour = date.getUTCHours();
                            }
                            else {
                                item.date = '';
                                item.hour = '';                        
                            }
                        });
                    },
                    error => console.log(error)
                )
        }
    },
    created() {
        this.update();
    },
    components:{EventProperties}
}
</script>
<style>
table, th, td {
  border: 1px solid;
}
</style>
